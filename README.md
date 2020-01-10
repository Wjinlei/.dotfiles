# 这是我的各种配置文件
## 如何恢复
恢复的时候 `rcup -t rcm` 然后再 `rcup`即可恢复全部<br/>
如果要恢复某个tag, 那么`rcup -t [tag名]`即可<br/>
例如：`rcup -t zsh` 就会恢复zsh相关的配置文件<br/>


## ranger<br/>
安装`ranger-git`<br/>
安装`ueberzug`以进行图片预览<br/>
安装`poppler`和`Pillow`以进行pdf预览<br/>
安装`w3m`以进行html预览<br/>
安装`highlight`以进行代码颜色预览<br/>
安装`ffmpegthumbnailer`以进行视频预览<br/>
安装`imagemagick`以进行Svg预览<br/>
安装`rar`, `unzip-iconv`, `p7zip`以进行压缩文件预览<br/>
安装`paramiko`以支持up命令,按键绑定是`P`<br/>
安装`atool`, `zip`, `p7zip`, `rar`以支持压缩功能, 按键绑定是`C`<br/>

- 下面以ArchLinux为例:
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
