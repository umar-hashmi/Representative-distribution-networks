# Representative reconfigurable networks:

## files:
* 4 clusters were identified, with centroids (ordered in ascending complexity):
    * case_1
    * case_2
    * case_3
    * case_4
* Additionally, I added 2 outlier cases of higher complexity (ordered in ascending complexity)(could be important for someone trying out reconfiguration methods that should be able to deal with more complex cases):
    * case_5
    * case_6

Note to myself: these cases (1, 2, 3, 4, 5, and 6) correspond to my original subnetworks (78, 21, 82, 24, 20, and 10).

## on the format:
The files are in matpower format. They are simplified to single phase. For now, only fixed loads are given...--> adjust!

I implemented the switches as simple branches with branch extensions indicating whether it is a switch. This is not the common way to model switches in PowerModels.jl (and might be good to transform them to actual switches), but I was not aware of that at the time. A list of the branch extensions is provided below:
* current ratings:  c_rating_a	
* is_switch boolean:    is_switch
* default switch state: z_branch_start
* branch_id corresponding to the format I used in python:   branch_id