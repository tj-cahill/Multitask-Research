exports.buildFocusHeader = () => {
    const practiceRuns = 4;
    const runs = 80;

    const fields = ['ParticipantID', 'TestTime'];

    const additionalFields = [];

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

    // Define aggregate variables here if necessary

    input.forEach(e => {
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
        });

        // Calculate and add aggregate variables here if necessary

        str += '\n';
    });

    return str;
}

// Helper functions for aggregation go here if necessary