### Because I can never remember how to do this.

```ps1
diskpart
list disk
select disk x
clean
create partition primary
active
format fs=exfat quick
exit
```
