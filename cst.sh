#!/bin/bash

# Script developed by Consistent Labs
# By kypanz - i am consistent, not perfect
# 

# Definir la ruta base del proyecto React
proyecto_path="./"
name_folder_components="components"
name_folder_utils="utils"
name_folder_redux="redux"

# ------ FUNCTIONS ----

create_component() {
    name=$1
    # Verifica si existe la el archivo .tsx del componente y crea el archivo
    if [ ! -d "$proyecto_path/src/$name" ]; then
        echo "Creando la carpeta del componente"
        mkdir "./src/$name_folder_components/$name"
    fi

    # Verifica si existe la carpeta del componente y crea el archivo
    if [ ! -d "$proyecto_path/src/$name/$name" ]; then
        echo "Creando el archivo del componente"
        touch "./src/$name_folder_components/$name/$name.tsx"
    fi
    echo "Componente '$name' creado exitosamente en ./src/$name_folder_components/$name/$name.tsx"
}

create_util() {
    name=$1
    # Verifica si existe la el archivo .tsx del componente y crea el archivo
    if [ ! -d "$proyecto_path/src/$name" ]; then
        echo "Creando carpeta del archivo util"
        mkdir "./src/$name_folder_utils/$name"
    fi

    # Verifica si existe la carpeta del componente y crea el archivo
    if [ ! -d "$proyecto_path/src/$name/$name" ]; then
        echo "Creando el archivo del util"
        touch "./src/$name_folder_utils/$name/$name.ts"
    fi
    echo "Componente '$name' creado exitosamente en ./src/$name_folder_utils/$name/$name.ts"
}

create_folder() {
    name_folder=$1
    # Verificar si existe la carpeta 'src'
    if [ ! -d "$proyecto_path/src" ]; then
        echo "Creando la carpeta 'src'..."
        mkdir "$proyecto_path/src"
    fi

    # Verificar si existe la carpeta 'components' dentro de 'src'
    if [ ! -d "$proyecto_path/src/$name_folder" ]; then
        echo "Creando la carpeta '$name_folder' dentro de 'src'..."
        mkdir "$proyecto_path/src/$name_folder"
    fi
}

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
        create_redux "$name_file"
    else
        echo "Selecciona una opcion valida"
    fi
else
    echo 'No mame, escribalo bien'
fi
