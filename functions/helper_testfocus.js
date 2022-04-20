exports.buildFocusHeader = () => {
    const practiceRuns = 4;
    const runs = 80;

    const fields = ['ParticipantID', 'TestTime'];

    const additionalFields = 
    [
        'AvgTimeR',
        'AvgTimeNR',
        'SwitchCost'
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

            if (subRes.isAnyRedTargetRotated) {
                TotalTimeR.push(subRes.timeCost);
            } else {
                TotalTimeNR.push(subRes.timeCost);
            }
        });

        // Calculate and add aggregate variables here if necessary
        let AvgTimeR = calculateAvg(TotalTimeR);
        let AvgTimeNR = calculateAvg(TotalTimeNR);
        let SwitchCost = AvgTimeR - AvgTimeNR;

        str += AvgTimeR + ',';
        str += AvgTimeNR + ',';
        str += SwitchCost + ',';

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