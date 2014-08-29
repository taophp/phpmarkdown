NAME								=   markdown
INI_DIR							=   /etc/php5
EXTENSION_DIR				=   $(shell php-config --extension-dir)
EXTENSION						=   ${NAME}.so
INI									=   ${NAME}.ini
LNTARGET						=   ../../mods-available/${INI}
LNNAME							=   conf.d/90-${INI}
COMPILER						=   g++
LINKER							=   g++
COMPILER_FLAGS			=   -Wall -c -O2 -std=c++11 -fpic -o
LINKER_FLAGS				=   -shared
LINKER_DEPENDENCIES =   -lphpcpp -lmarkdown
RM									=   rm -f
CP									=   cp -f
LN									=   ln -sf
MKDIR								=   mkdir -p
SOURCES							=   $(wildcard *.cpp)
OBJECTS							=   $(SOURCES:%.cpp=%.o)
all:		    ${OBJECTS} ${EXTENSION}

${EXTENSION}:	   ${OBJECTS}
			${LINKER} ${LINKER_FLAGS} -o $@ ${OBJECTS} ${LINKER_DEPENDENCIES}

${OBJECTS}:
			${COMPILER} ${COMPILER_FLAGS} $@ ${@:%.o=%.cpp}

install:
			${CP} ${EXTENSION} ${EXTENSION_DIR}
			${CP} ${INI} ${INI_DIR}/mods-available
			${LN} ${LNTARGET} ${INI_DIR}/${LNNAME}
			${LN} ${LNTARGET} ${INI_DIR}/apache2/${LNNAME}
			${LN} ${LNTARGET} ${INI_DIR}/cli/${LNNAME}
			${LN} ${LNTARGET} ${INI_DIR}/cgi/${LNNAME}

clean:
			${RM} ${EXTENSION} ${OBJECTS}
