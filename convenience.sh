#!/bin/bash
cd terraform-aws


#You need to escape your varibale values to be so that it contains no regex special characters, luckily this can be done with sed.
#clean variable to push around with sed

current_profile=$(echo $(cat provider.tf | awk -F'=' 'NR==2{print $2}'| sed -e 's/[]$.*[\^]/\\&/g'))

printf "\n\n your current aws profile is set to : $current_profile "


printf "\n the following prompt will let you set another existing profile for terraform\n"


read -p "your AWS profile : " p



profile=$(echo "${p}" | sed -e 's/[]$.*[\^]/\\&/g' )

sed -i -e "s/${current_profile}/${profile}/" provider.tf


printf "\n your profile is now set to $profile \n"


printf "\n\n\n\n happy aws terraforming!\n\n\n\n"