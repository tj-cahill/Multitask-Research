exports.buildFocusHeader = () => {
    const practiceRuns = 4;
    const runs = 80;

    const fields = ['ParticipantID', 'TestTime'];

    const additionalFields = [];

    for (let i = 0; i < practiceRuns; i++) {
        fields.push(`PT${i + 1}_rotated`);
        fields.push(`PT${i + 1}_distractors`);
        fields.push(`PT${i + 1}_cost`);
        fields.push(`PT${i + 1}_correct`);
    }

    for (let i = 0; i < runs; i++) {
        fields.push(`T${i + 1}_rotated`);
        fields.push(`T${i + 1}_distractors`);
        fields.push(`T${i + 1}_cost`);
        fields.push(`T${i + 1}_correct`);
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
            str += subRes.isAnyRedTargetRotated + ',';
            str += subRes.numberOfBlueRectangles + ',';
            str += subRes.timeCost + ',';
            str += subRes.userChoice + ',';
        });

        e.res.forEach(subRes => {
            str += subRes.isAnyRedTargetRotated + ',';
            str += subRes.numberOfBlueRectangles + ',';
            str += subRes.timeCost + ',';
            str += subRes.userChoice + ',';
        });

        // Calculate and add aggregate variables here if necessary

        str += '\n';
    });

    return str;
}

// Helper functions for aggregation go here if necessary