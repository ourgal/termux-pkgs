# My termux packages repo

## Add repo

```bash
mkdir $prefix/etc/apt/sources.list.d
echo "deb [trusted=yes] https://ourgal.github.io/termux-pkgs termux extras" > $prefix/etc/apt/soruces.list.d/termux-pkgs.list
pkg update
```
