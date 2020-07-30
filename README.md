## 先决条件
恢复配置依赖`https://github.com/thoughtbot/rcm`<br/>
`archlinux`系列可以通过`aur`来安装 `yay -S rcm-git`<br/>

## 如何恢复
恢复的时候 `rcup -t rcm` 然后再 `rcup`即可恢复全部<br/>
如果要恢复某个tag, 那么`rcup -t [tag名]`即可<br/>
例如：`rcup -t zsh` 就会恢复zsh相关的配置文件<br/>

### 其他依赖项
- Ranger
```
yay -S ranger-git
sudo pacman -S poppler
sudo pacman -S w3m
sudo pacman -S highlight
sudo pacman -S ffmpegthumbnailer
sudo pacman -S imagemagick
sudo pacman -S rar unzip-iconv p7zip
sudo pacman -S atool zip
pip install ueberzug
pip install Pillow
pip install paramiko
```
