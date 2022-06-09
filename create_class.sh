#!bin/bash

echo "Class name to create?"
read CLASSNAME

SOURCE_DIR=srcs
INCLUDE_DIR=includes

if [ ! -d $SOURCE_DIR ]; then
    mkdir $SOURCE_DIR
fi

if [ ! -d $INCLUDE_DIR ]; then
    mkdir $INCLUDE_DIR
fi

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