# ansible-skeleton-generator
Generate ansible directory skeleton via script.

## usage

	./create_ansible_skeleton.sh <projectname>

## what does it do?

Prior:

    sjas@ssg ~/wrk/ansible $ tree
    .
    ├── create_ansible_skeleton.sh
    └── README.md

    0 directories, 2 files

Running the script:

    sjas@ssg ~/wrk/ansible $ ./create_ansible_skeleton.sh example-role-for-illustrating

After:

    sjas@ssg ~/wrk/ansible $ tree
    .
    ├── ansible.cfg
    ├── create_ansible_skeleton.sh
    ├── inventory
    │   └── hosts
    ├── README.md
    ├── roles
    │   └── example-role-for-illustrating
    │       ├── files
    │       │   └── README.md
    │       ├── handlers
    │       │   ├── main.yml
    │       │   └── README.md
    │       ├── meta
    │       │   ├── main.yml
    │       │   └── README.md
    │       ├── tasks
    │       │   ├── main.yml
    │       │   └── README.md
    │       ├── templates
    │       │   ├── destination-filename.ext.j2
    │       │   └── README.md
    │       └── vars
    │           ├── main.yml
    │           └── README.md
    └── site.yml

    9 directories, 16 files
