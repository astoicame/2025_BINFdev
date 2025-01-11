# Author: S Sevilla
# Date: 1/8/25
# Description: Run script which deploys the nextflow workflow

# Input args
profile=$1 
outDir=$2
projectID=$3
input=$4


# housekeeping
if [[ -z $outDir || -z $profile || -z $projectID || -z $input ]]; then
    echo "All variables are required: profile outDir projectID input"
    exit 1
fi
if [[ ! -d $outDir ]]; then mkdir -p $outDir; fi


# run the workflow
nextflow run main.nf \
	-profile $profile \
	--outdir $outDir \
 	--projectID $projectID \
	--input $input \
	-resume
