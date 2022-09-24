exports.buildFocusHeader = () => {
    const practiceRuns = 4;
    const runs = 80;

    const fields = ['ParticipantID', 'TestTime'];

    const additionalFields = 
    [
        'AvgTimeR',
        'AvgTimeNR',
        'SwitchCost',
        'Distractor0_R_Tally',
        'Distractor2_R_Tally',
        'Distractor4_R_Tally',
        'Distractor6_R_Tally',
        'Distractor0_NR_Tally',
        'Distractor2_NR_Tally',
        'Distractor4_NR_Tally',
        'Distractor6_NR_Tally',
        'Total_FalseAlarm',
        'Total_Miss',
        'Total_CorrectRejection',
        'Total_Hit'
    ];

    for (let i = 0; i < practiceRuns; i++) {
        fields.push(`PT${i + 1}_type`);
        fields.push(`PT${i + 1}_NumDistractors`);
        // fields.push(`PT${i + 1}_choice`); // Not in spec; remove after debugging
        fields.push(`PT${i + 1}_correct`);
        fields.push(`PT${i + 1}_cost`);
    }

    for (let i = 0; i < runs; i++) {
        fields.push(`T${i + 1}_type`);
        fields.push(`T${i + 1}_NumDistractors`);
        // fields.push(`T${i + 1}_choice`); // Not in spec; remove after debugging
        fields.push(`T${i + 1}_correct`);
        fields.push(`T${i + 1}_cost`);
    }

    let totalArr = fields.concat(additionalFields);
    let header = "";
    for (let i = 0; i < totalArr.length; i++) {
        header += totalArr[i] + ',';
    }
    header += '\n';
    return header;
}

exports.buildFocusData = (input) => {
    let str = "";

    input.forEach(e => {
        // Define aggregate variables here if necessary
        let TotalTimeR = [];
        let TotalTimeNR = [];
        let Distractor0_R_Tally = 0;
        let Distractor2_R_Tally = 0;
        let Distractor4_R_Tally = 0;
        let Distractor6_R_Tally = 0;
        let Distractor0_NR_Tally = 0;
        let Distractor2_NR_Tally = 0;
        let Distractor4_NR_Tally = 0;
        let Distractor6_NR_Tally = 0;
        let Total_FalseAlarm = 0;
        let Total_Miss = 0;
        let Total_CorrectRejection = 0;
        let Total_Hit = 0;

        str += e.id + ',';
        str += e.test_time + ',';

        e.practice_res.forEach(subRes => {

            let isCorrect = (subRes.userChoice == subRes.isAnyRedTargetRotated);
            str += (subRes.isAnyRedTargetRotated ? "R" : "NR") + ',';
            str += subRes.numberOfBlueRectangles + ',';
            // str += (subRes.userChoice ? "R" : "NR") + ','; // Not in spec; remove after debugging
            str += isCorrect + ',';
            str += subRes.timeCost + ',';
        });

        e.res.forEach(subRes => {
            let isCorrect = (subRes.userChoice == subRes.isAnyRedTargetRotated);
            str += (subRes.isAnyRedTargetRotated ? "R" : "NR") + ',';
            str += subRes.numberOfBlueRectangles + ',';
            // str += (subRes.userChoice ? "R" : "NR") + ','; // Not in spec; remove after debugging
            str += isCorrect + ',';
            str += subRes.timeCost + ',';

            // Add time cost to appropriate tally
            if (subRes.isAnyRedTargetRotated) {
                TotalTimeR.push(subRes.timeCost);
            } else {
                TotalTimeNR.push(subRes.timeCost);
            }

            // Increment tallies based on number of distractors
            switch (subRes.numberOfBlueRectangles) {
                case 0:
                    subRes.isAnyRedTargetRotated ? Distractor0_R_Tally++ : Distractor0_NR_Tally++;
                    break;
                case 2:
                    subRes.isAnyRedTargetRotated ? Distractor2_R_Tally++ : Distractor2_NR_Tally++;
                    break;
                case 4:
                    subRes.isAnyRedTargetRotated ? Distractor4_R_Tally++ : Distractor4_NR_Tally++;
                    break;
                case 6:
                    subRes.isAnyRedTargetRotated ? Distractor6_R_Tally++ : Distractor6_NR_Tally++;
                    break;
            }

            // Increment counter based on correctness of user choice
            if (!subRes.isAnyRedTargetRotated && !isCorrect) {
                Total_FalseAlarm++;
            } else if (subRes.isAnyRedTargetRotated && !isCorrect) {
                Total_Miss++;
            } else if (!subRes.isAnyRedTargetRotated && isCorrect) {
                Total_CorrectRejection++;
            } else if (subRes.isAnyRedTargetRotated && isCorrect) {
                Total_Hit++;
            }
        });

        // Calculate and add aggregate variables here if necessary
        let AvgTimeR = calculateAvg(TotalTimeR);
        let AvgTimeNR = calculateAvg(TotalTimeNR);
        let SwitchCost = AvgTimeR - AvgTimeNR;

        str += AvgTimeR + ',';
        str += AvgTimeNR + ',';
        str += SwitchCost + ',';
        str += Distractor0_R_Tally + ',';
        str += Distractor2_R_Tally + ',';
        str += Distractor4_R_Tally + ',';
        str += Distractor6_R_Tally + ',';
        str += Distractor0_NR_Tally + ',';
        str += Distractor2_NR_Tally + ',';
        str += Distractor4_NR_Tally + ',';
        str += Distractor6_NR_Tally + ',';
        str += Total_FalseAlarm + ',';
        str += Total_Miss + ',';
        str += Total_CorrectRejection + ',';
        str += Total_Hit + ',';

        str += '\n';
    });

    return str;
}

// Helper functions for aggregation go here if necessary
const calculateAvg = (input) => {
    var total = 0;
    for (var i = 0; i < input.length; i++) {
        total += input[i];
    }
    var avg = total / input.length;
    return avg;
}