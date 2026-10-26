function colimastart --wraps='colima start --profile ozon --cpu 2 --disk 60' --description 'alias colimastart=colima start --profile ozon --cpu 2 --disk 60'
    colima start --profile ozon --cpu 2 --disk 60 $argv
end
