#!/bin/bash

# Script developed from Consistent Labs
# By kypanz - i am consistent, not perfect

# Define the routes for the Reactjs project
proyecto_path="./"
name_folder_components="components"
name_folder_utils="utils"
name_folder_redux="redux"

# ------ FUNCTIONS ----
create_component() {
    name=$1
    if [ ! -d "$proyecto_path/src/$name" ]; then
        echo "Creando la carpeta del componente"
        mkdir "./src/$name_folder_components/$name"
    fi
    if [ ! -d "$proyecto_path/src/$name/$name" ]; then
        echo "Creando el archivo del componente"
        touch "./src/$name_folder_components/$name/$name.tsx"
    fi
    echo "Componente '$name' creado exitosamente en ./src/$name_folder_components/$name/$name.tsx"
}

create_util() {
    name=$1
    if [ ! -d "$proyecto_path/src/$name" ]; then
        echo "Creando carpeta del archivo util"
        mkdir "./src/$name_folder_utils/$name"
    fi
    if [ ! -d "$proyecto_path/src/$name/$name" ]; then
        echo "Creando el archivo del util"
        touch "./src/$name_folder_utils/$name/$name.ts"
    fi
    echo "Componente '$name' creado exitosamente en ./src/$name_folder_utils/$name/$name.ts"
}

create_slice(){
  name=$1
  if [ ! -d "$proyecto_path/src/$name_folder_redux/$name" ]; then
        echo "Creating the slice folder"
        mkdir "./src/$name_folder_redux/$name"
    fi
    if [ ! -d "$proyecto_path/src/$name_folder_redux/$name/$name.ts" ]; then
        echo "Creating the slice file"
        touch "./src/$name_folder_redux/$name/$name.ts"
    fi
    echo "Slide file '$name' created successful on ./src/$name_folder_redux/$name/$name.ts"
}

create_folder() {
    name_folder=$1
    if [ ! -d "$proyecto_path/src" ]; then
        echo "Creating the folder 'src'..."
        mkdir "$proyecto_path/src"
    fi
    if [ ! -d "$proyecto_path/src/$name_folder" ]; then
        echo "Creating the folder '$name_folder' into the 'src'..."
        mkdir "$proyecto_path/src/$name_folder"
    fi
}
# ---- End functions ----


# ---- Main ----
action=$1
option=$2
name_file=$3

if [ "$action" = "new" ]; then
    echo $option
    if [ "$option" = "component" ]; then
        create_folder "$name_folder_components"
        create_component "$name_file"
    elif [ "$option" = "util" ]; then
        create_folder "$name_folder_utils"
        create_util "$name_file"
    elif [ "$option" = "slice" ]; then
        create_folder "$name_folder_redux"
        create_slice "$name_file"
    else
        echo "Write a valid argument"
    fi
else
    echo 'Wrong command'
fi
