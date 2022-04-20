exports.buildFocusHeader = () => {
    const practiceRuns = 4;
    const runs = 80;

    const fields = ['ParticipantID', 'TestTime'];

    const additionalFields = 
    [
        'AvgTimeR',
        'AvgTimeNR',
        'SwitchCost',
        'Total_FalseAlarm',
        'Total_Miss',
        'Total_CorrectRejection',
        'Total_Hit'
    ];

    for (let i = 0; i < practiceRuns; i++) {
        fields.push(`PT${i + 1}_type`);
        fields.push(`PT${i + 1}_NumDistractors`);
        fields.push(`PT${i + 1}_correct`);
        fields.push(`PT${i + 1}_cost`);
    }

    for (let i = 0; i < runs; i++) {
        fields.push(`T${i + 1}_type`);
        fields.push(`T${i + 1}_NumDistractors`);
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
        let Total_FalseAlarm = 0;
        let Total_Miss = 0;
        let Total_CorrectRejection = 0;
        let Total_Hit = 0;

        str += e.id + ',';
        str += e.test_time + ',';

        e.practice_res.forEach(subRes => {
            str += (subRes.isAnyRedTargetRotated ? "R" : "NR") + ',';
            str += subRes.numberOfBlueRectangles + ',';
            str += subRes.userChoice + ',';
            str += subRes.timeCost + ',';
        });

        e.res.forEach(subRes => {
            str += (subRes.isAnyRedTargetRotated ? "R" : "NR") + ',';
            str += subRes.numberOfBlueRectangles + ',';
            str += subRes.userChoice + ',';
            str += subRes.timeCost + ',';

            // Add time cost to appropriate tally
            if (subRes.isAnyRedTargetRotated) {
                TotalTimeR.push(subRes.timeCost);
            } else {
                TotalTimeNR.push(subRes.timeCost);
            }

            // Increment counter based on correctness of user choice
            if (!subRes.isAnyRedTargetRotated && !subRes.userChoice) {
                Total_FalseAlarm++;
            } else if (subRes.isAnyRedTargetRotated && !subRes.userChoice) {
                Total_Miss++;
            } else if (!subRes.isAnyRedTargetRotated && subRes.userChoice) {
                Total_CorrectRejection++;
            } else if (subRes.isAnyRedTargetRotated && subRes.userChoice) {
                Total_Hit++;
            }
        });

        // Calculate and add aggregate variables here if necessary
        let AvgTimeR = calculateAvg(TotalTimeR);
        let AvgTimeNR = calculateAvg(TotalTimeNR);
        let SwitchCost = Math.abs(AvgTimeR - AvgTimeNR);

        str += AvgTimeR + ',';
        str += AvgTimeNR + ',';
        str += SwitchCost + ',';
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