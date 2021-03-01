#!/bin/bash


# GIT Folders

echo "> Removing Git Folders ...";

rm -rf ./plugged/*/.git           2> /dev/null;
rm -rf ./plugged/*/.gitattributes 2> /dev/null;
rm -rf ./plugged/*/.gitignore     2> /dev/null;
rm -rf ./plugged/*/.github        2> /dev/null;

# IDE Files

echo "> Removing IDE Files and Folders ...";

rm ./plugged/*/.projections.json 2> /dev/null;


# Build Environment Files

echo "> Removing Build Environment Files ...";

rm -rf ./plugged/*/test       2> /dev/null;
rm ./plugged/*/.appveyor.yml  2> /dev/null;
rm ./plugged/*/.travis.yml    2> /dev/null;
rm ./plugged/*/Dockerfile     2> /dev/null;

# Meta Data

echo "> Removing Meta Files ...";

rm ./plugged/*/CHANGELOG     2> /dev/null;
rm ./plugged/*/CHANGELOG.md  2> /dev/null;
rm ./plugged/*/CHANGELOG.rst 2> /dev/null;
rm ./plugged/*/CHANGELOG.txt 2> /dev/null;
rm ./plugged/*/LICENSE       2> /dev/null;
rm ./plugged/*/LICENSE.md    2> /dev/null;
rm ./plugged/*/LICENSE.rst   2> /dev/null;
rm ./plugged/*/LICENSE.txt   2> /dev/null;
rm ./plugged/*/README        2> /dev/null;
rm ./plugged/*/README.md     2> /dev/null;
rm ./plugged/*/README.rst    2> /dev/null;
rm ./plugged/*/README.txt    2> /dev/null;


echo "> Cleaning ale ...";

rm ./plugged/ale/run-tests          2> /dev/null;
rm ./plugged/ale/run-tests.bat      2> /dev/null;
rm ./plugged/ale/supported-tools.md 2> /dev/null;
rm -rf ./plugged/ale/img            2> /dev/null;


echo "> Cleaning supertab ...";

rm ./plugged/supertab/Makefile 2> /dev/null;


echo "> Cleaning lightline.vim ...";

rm ./plugged/lightline.vim/colorscheme.md 2> /dev/null;


echo "> Cleaning vim-man ...";

rm ./plugged/vim-man/improvements.md 2> /dev/null;


echo "Done";
exit 0;

