#!bin/bash


function ask_class_details
{
    echo "Class name to create?"
    read CLASSNAME
}

function create_source_dir
{
    if [ ! -d $SOURCE_DIR ]; then
        mkdir $SOURCE_DIR
    fi
}

function create_include_dir
{
    if [ ! -d $INCLUDE_DIR ]; then
        mkdir $INCLUDE_DIR
    fi
}

function create_cpp_file
{
    if [ ! -s $SOURCE_DIR/$CLASSNAME.cpp ]; then
        touch $SOURCE_DIR/$CLASSNAME.cpp \
        && echo -e "#include \"../includes/$CLASSNAME.hpp\"\n\n" \
        "//CONSTRUCTOR DESTRUCTOR COPY\n" \
        "$CLASSNAME::$CLASSNAME()\n" \
        "{\n\n" \
        "};\n\n" \
        "$CLASSNAME::$CLASSNAME($CLASSNAME const & cpy)\n" \
        "{\n\n" \
        "};\n\n" \
        "$CLASSNAME::~$CLASSNAME()\n" \
        "{\n\n" \
        "};\n\n" \
        "$CLASSNAME & $CLASSNAME::operator=($CLASSNAME const & rhs)\n" \
        "{\n\n" \
        "};\n\n" \
        >> $SOURCE_DIR/$CLASSNAME.cpp
    fi
}

function create_hpp_file
{
    if [ ! -s $INCLUDE_DIR/$CLASSNAME.hpp ]; then
        touch $INCLUDE_DIR/$CLASSNAME.hpp \
        && echo -e "#ifndef ${CLASSNAME^^}_HPP\n" \
        "# define ${CLASSNAME^^}_HPP\n\n" \
        "class $CLASSNAME {\n" \
        "   private:\n\n" \
        "   public:\n" \
        "       //CONSTRUCTOR DESTRUCTOR COPY\n" \
        "       $CLASSNAME();\n" \
        "       $CLASSNAME($CLASSNAME const & cpy);\n" \
        "       ~$CLASSNAME();\n" \
        "       $CLASSNAME & operator=($CLASSNAME const & rhs);\n" \
        "};\n\n" \
        "#endif" \
        >> $INCLUDE_DIR/$CLASSNAME.hpp
    fi
}

function main
{
    SOURCE_DIR=srcs
    INCLUDE_DIR=includes
    ask_class_details
    create_include_dir
    create_source_dir
    create_cpp_file
    create_hpp_file
}

main