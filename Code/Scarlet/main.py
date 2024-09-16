from subprocess import run, DEVNULL
import json
import pandas as pd

with open('backup_16_09_24.txt') as f:
    data = json.load(f)


# Find out names of folders
dfolders = pd.DataFrame.from_dict(data["folders"])
folders = dict(zip(dfolders["title"], dfolders["uuid"]))
# print(folders)

# Filter notes
notes = data["notes"]
df = pd.DataFrame.from_dict(notes)
# print(df)
df = df[df["state"] != "TRASH"]
df["timestamp"] = df["timestamp"].apply(lambda x: int(x / 1000))  # Remove last 3 digits of timestamps for epoch conversion

# TODO: Change which folder is queried for...
# NOTE: done: port
# NOTE: todo: ...
folder = "*Memories"
notes_in_folder = df[df["folder"] == folders[folder]]

# Make notes into files
for i, note in notes_in_folder.iterrows():
    content = json.loads(note["description"])["note"]
    cdf = pd.DataFrame.from_dict(content)
    string = "\n\n---\n\n".join(cdf["text"])

    # Determine note title
    headers = cdf[cdf["format"] == "HEADING"]
    if headers.shape[0] > 0:
        title = headers["text"][0]
    else:
        title = string[:20]
    title = "--".join(title.split("/"))
    title = "---".join(title.split("\n"))

    # Change system date to preserve creation date
    ts = note["timestamp"]
    date = run(["date", "-d", f"@{ts}"], capture_output=True).stdout.decode().split('\n')[0]
    run(["date", f"--set={date}"], stdout=DEVNULL)
    with open(f"results/{folder}/{title}.md", 'w') as f:
        f.write(string)
    run(["chown", "croniev", f"results/{folder}/{title}.md"])
