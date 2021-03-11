### Because I can never remember how to do this.

Installing 7zip/p7zip.
```sh
# Windows
choco install 7zip.install

# Debian Based
sudo apt install p7zip-full p7zip-rar -y
```

Create an archive.
```sh
7z a fileName.7z # Archive all files in CWD.
7z a fileName.7z folderName # Archive a folder and its contents.
7z a fileName.7z ./folderName/* # Archive the contents of a folder.
```

Add to an archive or delete from an archive. Same rules apply.
```sh
7z u filename.7z *
7z d fileName.7z *
```

Extract or view contents of a file.
```sh
7z e fileName.7z
7z l fileName.7z
```

---

- Linux compress archive: `tar cf - directory | 7za a -si directory.tar.7z`
- Linux extract archive: `7za x -so directory.tar.7z | tar xf -`
