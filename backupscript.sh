#!/bin/bash
# $1 is the world dir path

#Backup Region File Function
back_up_region_files()
{
    CURRENTDATE=`date +"%Y-%m-%d"`
    echo $CURRENTDATE  "Backing Up Region Files...."
    worldDirPath=$1
    backupsDir="$worldDirPath/backups"
    regionDir="$worldDirPath/region"

    if [ ! -d $regionDir ]; then
       echo "No region Dir Found"
       return
    fi

    
    if [ ! -d $backupsDir ]; then
        echo "Making backups Dir"
        sudo mkdir $1backups
    fi
    
    
    zip -r -q $backupsDir/region_$CURRENTDATE.zip $regionDir
         
}

#Main Program

LASTUPDATEDATE=`date +"%Y-%m-%d"`
back_up_region_files $1
while [ true ]
do
   CURRENTDATE=`date +"%Y-%m-%d"`
   if [ "$CURRENTDATE" != "$LASTUPDATEDATE"  ]; then
        back_up_region_files $1
        LASTUPDATEDATE=$CURRENTDATE
   fi
done