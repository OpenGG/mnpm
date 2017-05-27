# mnpm

mnpm init script

## The easy way

**WARNING: the install scripts have only been tested on the lastest macOS(10.12), and should be used with cautions.**

**_If you are using other operation systems, you may [take the hard way](#the-hard-way) instead._**

0. Install Node.js with [nvm](https://github.com/creationix/nvm).
0. Install `mnpm`

    ```bash
    curl -o- https://raw.githubusercontent.com/OpenGG/mnpm/master/install.sh | bash
    ```

0. (Optional) Install `myarn`

    ```bash
    curl -o- https://raw.githubusercontent.com/OpenGG/mnpm/master/install-myarn.sh | bash
    ```
0. Reload `.profile` if you don't want to init another session.
    ```bash
    source ~/.profile
    ```

## The hard way

`mnpm` and `myarn` are basically aliases for `npm` and `yarn`, with some extra args.

Instead of running the install scripts above, you can put the alias code into `.profile` file manually.


0. Install Node.js with [nvm](https://github.com/creationix/nvm).
0. Alias `mnpm` in `.profile` file

    ```bash
    echo "" >> ~/.profile
    echo 'alias mnpm="npm --registry=http://r.npm.sankuai.com \
      --cache=$HOME/.cache/mnpm \
      --disturl=http://npm.sankuai.com/dist/node \
      --userconfig=$HOME/.mnpmrc"' >> ~/.profile
    ```

0. (Optional) Alias `myarn` in `.profile` file

    ```bash
    echo "" >> ~/.profile
    echo 'alias myarn="YARN_CACHE_FOLDER=$HOME/.cache/myarn-cache NPM_CONFIG_USERCONFIG=$HOME/.myarnrc yarn"' >> ~/.profile
    ```

0. (Optional) Create `.myarnrc` file

    ```bash
    echo '
    registry=http://r.npm.sankuai.com
    cache=$HOME/.cache/myarn
    disturl=http://npm.sankuai.com/dist/node
    ' > ~/.myarnrc
    ```

0. Reload `.profile` if you don't want to init another session.
    ```bash
    source ~/.profile
    ```

