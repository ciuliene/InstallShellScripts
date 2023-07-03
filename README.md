# Install Script

This script allows you to install and uninstall shell scripts and manage aliases in your environment.

## Usage

Run the script with the following options:

- To install a shell script:

```shell
install_script <sh_file_name>
```

- To uninstall a script:

```shell
install_script <script_name> -u
```

- To print the list of all installed scripts:

```shell
install_script -l
```

## Options

- `<sh_file_name>`: The name of the sh file to install.

- `<script_name> -u`: The name of the script to uninstall.

- `-l`: Print the list of all installed scripts.

- `-h`: Print tool instructions

## Examples

To install a script called `myscript.sh`:

```shell
install_script myscript.sh
```

To uninstall a script named `myscript`:

```shell
install_script myscript -u
```

To print the list of all installed scripts:

```shell
install_script -l
```

NOTE: you can install this script by executing this command (move to the directory where the file is located):

```shell
sh ./install_script.sh install_script.sh
```

## Dependencies

This script assumes that you are using the Zsh shell and have a `~/.zshrc` file.

## License

This script is licensed under the [MIT License](LICENSE).

```
Feel free to customize and modify it according to your needs.
```
