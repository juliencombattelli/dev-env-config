FROM ubuntu:devel

ENV LC_ALL=C.UTF-8

RUN apt update -y && \
    apt install --no-install-recommends -y \
        wget curl ca-certificates git \
        vim zsh zsh-syntax-highlighting \
        build-essential clang clang-format clang-tidy clang-tools

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

COPY .p10k.zsh .zshrc /root/

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY .vimrc.part1 .vimrc.part2 /root/

RUN cat ~/.vimrc.part1 > ~/.vimrc && \
    vim +PluginInstall +qall && \
    cat ~/.vimrc.part2 >> ~/.vimrc

WORKDIR /root
CMD ["zsh"]