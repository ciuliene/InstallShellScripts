# Install scripts

This document will guide you to configure shell scripts as global, so you can run them wherever you are.

## 1. Move a script

The first thing to do is to copy or move your script into `/usr/local/bin` with one of these commands:

```sh
cp /path/to/script.sh /usr/local/bin

# or

mv /path/to/script.sh /usr/local/bin
```

## 2. Enable the execute permission

Unix-Like systems provide the `chmod` command which is used to change file and folder permission.
The `+x` parameter is used to add the x permission which is the symbol for the execute permission. The execution permission will give the execution ability to the owner user or group of the file. The + will add provided ability and - minus will remove the provided ability.

Thus enable the script permission running this command:

```sh
chmod +x /usr/local/bin/script.sh
```

After this command, you are able to run your script wherever you are, simply calling it:

```sh
script.sh
```

## 3. Provide an alias

Finally, you can configure an alias for your script. An alias is a name provided to the script. "Launching" the alias is exactly like launching the original script. 

This step is based on your shell environment.

So if you are using `bash`, execute this command:

```sh
vi ~/.bash_profile
```

If you are using `zsh` instead, execute this one:

```sh
vi ~/.zshrc
```

### Note

- `Option+5` to type `~` (tilde)
- This guide uses `vi` but you can use your favorite editor.

After opening the file, enter this line wherever you want (typically at the end of the file):

```sh
alias <alias-name>=<script>
```

Where `<alias-name>` is the alias you will use and `<script>` is the name of script, like `script.sh`
