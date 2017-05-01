#!/bin/bash

## create an ansible base structure



# without parameters show help and exit
if [ "$#" -eq 0 ]
then
    echo "
USAGE:
	$0 <projectname>
"
    exit 0
fi



PROJECT="$*"

ROLE_PATH=roles/$PROJECT
INVENTORY_PATH=inventory

HOSTS=hosts
ANSIBLE_CFG=ansible.cfg

FILES=files
HANDLERS=handlers
HOSTS=hosts
META=meta
TASKS=tasks
TEMPLATES=templates
VARS=vars

HOSTS_FILE=$INVENTORY_PATH/$HOSTS

STRING_ANSIBLE_CFG="$ANSIBLE_CFG : Defaults configuration, don't use /etc/ansible/ansible.cfg or ~/.ansible instead of this one."
STRING_DEFAULTS="$DEFAULTS : default value definitions for your variables go in here."
STRING_FILES="$FILES : Files to be copied without modification go in here."
STRING_HANDLERS="$HANDLERS : Tasks which will only execute when notified by other tasks', after their states have changed upon running the task."
STRING_HOSTS="$HOSTS : Host inventory definition."
STRING_META="$META : Specify other roles upon which the current role is dependant upon in here."
STRING_TASKS="$TASKS : Here is at least one main.yml defining the path of execution. The tasks folder is the only one that MUST exist."
STRING_TEMPLATES="$TEMPLATES : Jinja .j2 templates (= parametrized files) go in here."
STRING_VARS="$VARS : Role-related variable definitions go in here."




# create directories, files and readmes
mkdir -p $INVENTORY_PATH
echo "
# $STRING_HOSTS
#[group_1]
#NON-FQDN-DN_1
#NON-FQDN-DN_2
" > $HOSTS_FILE && sed -i 1d $HOSTS_FILE

echo "[defaults]
hostfile = hosts
host_key_checking = False
ansible_ssh_user = root
ansible_ssh_port = 22
ansible_connection = smart
ansible_shell_type = sh
" > $ANSIBLE_CFG

echo "# site.yml: The default playbook, all needed tasks should go in here.
" > site.yml

for i in $DEFAULTS $FILES $HANDLERS $META $TASKS $TEMPLATES $VARS
do
    DOCSTRING=STRING_$i
    LOCATION=$ROLE_PATH/$i

    [ ! -d $LOCATION ] && mkdir $LOCATION -p
    echo $DOCSTRING > $LOCATION/README.md
done

for i in $DEFAULTS $HANDLERS $META $TASKS $VARS
do
    LOCATION=$ROLE_PATH/$i
    echo "# stubfile" > $LOCATION/main.yml
done

echo "# stubfile" > $ROLE_PATH/$TEMPLATES/destination-filename.ext.j2
