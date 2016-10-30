# Backups
##backing up your data to avoid loosing your work.

There are many reasons why everyone must have a backup at reach, and the questions what,when and where to backup become more important.

###Manual backups with Tar
Tar command can compress and uncompress files on you machine, you can save some space and reduce the amount of data that needs to be transfer if need be because it will generate only one file but restoring the data to be usable again by decompressing the file can take some time.

1. the path for this file-system backup can be set manually.

2. The command is manual, but you can set it to run automatically with a task scheduler.

3. the file is created on the machine. If you want to move it somewhere else, you'll have to set that up manually too.

4. Finally, you should decide how long to keep your old backups and how many to store at once.

example of tar command:
`tar pczvf my_backup_file.tar.gz /path/to/source/content`

Explanation of flags:

p or --preserve-permissions: Preserves permissions
c or --create: Creates a new archive
z or --gzip: Compresses the archive with gzip
v or --verbose: Shows which files were processed
f or --file=ARCHIVE: Tells us that the next argument is the name for the new archive file

For more details of tar and more examples, look for more information on Archiving and Compressing files with GNU Tar and GNU Zip.




