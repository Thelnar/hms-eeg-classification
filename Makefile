.PHONY : setup clean
.RECIPEPREFIX = >
SHELL = /bin/bash
KAGGLEJSON = $(addsuffix kaggle.json, ${KAGGLE_CONFIG_DIR})

setup : ${TEST_CSV}
> @echo You\'re all set!

${TEST_CSV}: DESTINATION = $(dir ${TEST_CSV})
${TEST_CSV}: | ${ZIP_FILE}
> @echo unzipping...
> @echo unzip ${ZIP_FILE} -d ${DESTINATION}

${ZIP_FILE}: DESTINATION = $(dir ${ZIP_FILE})
${ZIP_FILE}: | ${KAGGLEJSON}
> @echo downloading zip from kaggle...
> @echo kaggle competitions download -c ${COMPETITION_NAME} --path ${DESTINATION}

${KAGGLEJSON}:
> $(error kaggle.json not found. Please place in ${KAGGLEJSON})

clean: FOLDER = $(dir ${TEST_CSV})
clean:
> @echo -e Are you sure?\\nThis deletes all files in ${FOLDER} \\nAs well as ${ZIP_FILE}
> @select YN in "Yes" "No" ; do \
>    case $${YN} in \
>        Yes ) rm -r ${FOLDER}/* ; rm ${ZIP_FILE} ; break;; \
>        No ) echo exiting... ; break;; \
>    esac; \
> done;