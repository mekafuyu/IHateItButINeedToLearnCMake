print_help() {
    echo "Commands:"
    echo "    c <project_name>  Configures the project."
    echo "    b <project_name>  Builds the project."
    echo "    r <project_name>  Runs the project."
    echo "    clean             Remove all build/configure output folders."
    echo "    help,h            Shows this."
}

if [[ "$1" == "h" || "$1" == "help" ]]; then
    print_help
    exit 0
fi

if [[ "$1" == "clean" ]]; then
    echo "Cleaning..."
    ./scripts/clean.sh
    exit 0
fi

if [[ -z "$2" ]]; then
    echo "The second argument is missing"
    exit 1
fi

if [[ ! -d "$2" ]]; then
    echo "The project does not exist."
    exit 1
fi

if [[ "$1" == *"c"* ]]; then
    echo "Configuring..."
    ./scripts/config.sh "$2"
    if [[ $? -ne 0 ]]; then
        echo "Error when configuring! Aborting!"
        exit 1
    fi
fi

if [[ "$1" == *"b"* ]]; then
    echo "Building..."
    ./scripts/build.sh "$2"
    if [[ $? -ne 0 ]]; then
        echo "Error when building! Aborting!"
        exit 1
    fi
fi

if [[ "$1" == *"r"* ]]; then
    echo "Running..."
    ./scripts/build.sh "$2"
    if [[ -z "$3" ]]; then
        ./scripts/run.sh "$2"
    else
        ./scripts/run.sh "$2" "$3"
    fi
    if [[ $? -ne 0 ]]; then
        echo "Error when running! Aborting!"
        exit 1
    fi
fi