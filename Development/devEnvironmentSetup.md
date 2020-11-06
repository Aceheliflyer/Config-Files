# My Development Setup

<details>
<summary>NOTE</summary>
Yes, I still use Windows and no, I don't want to switch to Linux. Please quit telling me to switch to Linux because I don't want to, it's just not for me, yet anyways. No, I don't want to use VMs and no, I don't want to dual boot.
</details>

## Install Linux on Windows

1. Enable WSL by running the code below in PowerShell as Administrator.
```
> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

2. Install any Linux Distro of your choosing in the Windows Store. I like to use [Ubuntu](https://microsoft.com/store/productId/9NBLGGH4MSV6).

3. Install the [Windows Terminal (Preview)](https://microsoft.com/store/productId/9N0DX20HK701) on the Windows Store.

4. Run the following:
```
$ sudo apt update
$ sudo apt full-upgrade
```

## Customizing the Terminal

1. Install the Hasklug Nerd Font at the [Nerd Fonts Downloads](https://nerdfonts.com/font-downloads), you'll need to install the Windows Compatible files. (This is basically Hasklig but font patched, I think?)

2. Set your Windows Terminal settings to the following:

<details>
<summary>Windows Terminal Settings</summary>
{
  "$schema": "https://aka.ms/terminal-profiles-schema",
  "defaultProfile": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
  "copyOnSelect": false,
  "copyFormatting": false,
  "profiles": {
    "defaults": {
      "colorScheme": "One Half Dark",
      "fontFace": "Hasklug NF",
      "useAcrylic": true,
      "acrylicOpacity": 0.75
    },
    "list": [
      {
        "name": "Command Prompt",
        "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
        "commandline": "cmd.exe",
        "hidden": false
      },
      {
        "name": "Windows PowerShell",
        "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
        "commandline": "powershell.exe",
        "hidden": false
      },
      {
        "name": "Ubuntu",
        "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
        "source": "Windows.Terminal.Wsl",
        "startingDirectory": "//wsl$/Ubuntu/home/username",
        "hidden": false
      },
      {
        "name": "Azure Cloud Shell",
        "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
        "source": "Windows.Terminal.Azure",
        "hidden": true
      }
    ]
  },
  "schemes": [],
  "keybindings": [
    {
      "command": {
        "action": "copy",
        "singleLine": false
      },
      "keys": "ctrl+c"
    },
    {
      "command": "paste",
      "keys": "ctrl+v"
    },
    {
      "command": "find",
      "keys": "ctrl+shift+f"
    },
    {
      "command": {
        "action": "splitPane",
        "split": "auto",
        "splitMode": "duplicate"
      },
      "keys": "alt+shift+d"
    }
  ]
}
</details>

NOTE: You will have to change some things such as your username.

## Customizing the Prompt

1. Install [Oh My ZSH](https://ohmyz.sh/#install) by running the code below.
```
$ sudo apt install zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh) by running the following code below.
```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

3. Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

4. Install [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) and [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh) by runninng the following.
```
$ git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Make sure your plugins in `~/.zshrc` file looks like the following:
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
```

5. Install [`thefuck`](https://github.com/nvbn/thefuck#installation) by running the following.
```
$ sudo apt update
$ sudo apt install python3-dev python3-pip python3-setuptools
$ sudo pip3 install thefuck

# Add `thefuck` to your plugins in your `~/.zshrc` file.
# You'll now be able to run `$ fuck` to fix your previous command.
```

6. Install [`fzf`](https://github.com/junegunn/fzf#using-linux-package-managers) by running the following.
```
$ sudo apt install fzf

# Add `fzf` to your plugins in your `~/.zshrc` file.
# You'll now be able to have a fancy `ctrl + r` menu to run commands in your history.
```

## Adding Software Things / Addons / Stuffs / I don't Kn0w

1. Install [neofetch](https://github.com/dylanaraps/neofetch/wiki/Installation#ubuntu-1704-and-up) with `sudo apt install neofetch`.

1. Install the GitHub CLI [here](https://github.com/cli/cli#debianubuntu-linux).

2. Install [nvm](https://github.com/nvm-sh/nvm#install--update-script) with `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash`.

3. Add `git nvm vscode` to your `~/.zshrc` file. (Git is typically in there by default.)

4. In the end, your plugins should look something like this: `plugins=(git vscode nvm fzf thefuck zsh-autosuggestions zsh-syntax-highlighting)`

5. You can add `zsh-interactive-cd zsh_reload` for an interactive cd and a simple reload command.

6. Install [colorls](https://github.com/athityakumar/colorls#installation) with `sudo apt install ruby-full` & `gem install colorls` then add the following to your `~/.zshrc` file.
```
source $(dirname $(gem which colorls))/tab_complete.sh
alias la='colorls -A1 --sd' # List everything.
alias li='colorls -Al --sd' # List all information.
alias lf='colorls -Af1' # List all files.
alias ld='colorls -Ad1' # List all directories.
alias lt='colorls --tree'
```
