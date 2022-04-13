// ===============================[Ex 1]=================================
function isPrimeNumber(number) {
    if (number instanceof Array) { //Handle array
        number.forEach(num => isPrimeNumber(num));
        return;
    }
    if (number % 2 === 0 && number > 2) return console.log(number + " is not prime number"); //Simple check
    for (let i = 3; i <= Math.sqrt(number); i += 2) { //Main check
        if (number % i === 0) return console.log(number + " is not prime number");
    }
    return console.log(number + " is prime number");
}

// isPrimeNumber([4, 1, 2, 121]);



// ===============================[Ex 2]=================================
const bracketsRegExp = new RegExp(/[()]/g);
const operationTypeRegExp = new RegExp(/([^(|)\w\d\s])/g);
const numberSplitRegExp = new RegExp(/(?<=\d)\s+(?=\d)/g);

/**
 * Check if this expression is valid
 * @param stringExpression
 * @returns {false|number|boolean}
 */
function isValid(stringExpression) {
    const openBracketsAmountRegMath = stringExpression.match(/[(]/g);
    const closeBracketsAmountRegMath = stringExpression.match(/[)]/g);
    const operationTypeAmountRegMath = stringExpression.match(operationTypeRegExp);
    const decimalsAmountRegMath = stringExpression.match(/\d/g);

    const openBracketsAmount = openBracketsAmountRegMath === null ? 0 : openBracketsAmountRegMath.length;
    const closeBracketsAmount = closeBracketsAmountRegMath === null ? 0 : closeBracketsAmountRegMath.length;

    let firstCond =  openBracketsAmount === closeBracketsAmount; //Brackets
    let secondCond = openBracketsAmount === (operationTypeAmountRegMath === null ? 0 : operationTypeAmountRegMath.length) - 1; //Brackets = operation - 1
    let thirdCond = (decimalsAmountRegMath === null ? 0 : decimalsAmountRegMath.length) - 1 === (openBracketsAmount * 2);//Brackets * 2 = decimals - 1

    return firstCond && secondCond && thirdCond;
}

/**
 * Calc only simple expressions. Such as: (+ 1 6)
 * @param simpleStringExpression
 */
function calcSimpleExpression(simpleStringExpression) {
    const expression = simpleStringExpression.replace(bracketsRegExp, "");
    const operationTypePosition = expression.search(operationTypeRegExp);
    const operationType = expression[operationTypePosition];
    const strValues = expression.substring(operationTypePosition + 1).split(numberSplitRegExp);
    const firstValue = Number.parseInt(strValues[0]);
    const secondValue = Number.parseInt(strValues[1]);

    switch (operationType) {
        case "+":
            return firstValue + secondValue;
        case "-":
            return firstValue - secondValue;
        case "*":
            return firstValue * secondValue;
        case "/":
            return firstValue / secondValue;
    }
}

/**
 * Calc string expression
 * @param stringExpression
 * @param checked
 * @returns {string}
 */
function calc(stringExpression, checked = false) {
    if(!checked) if (!isValid(stringExpression)) return "Wrong expression. Example: * (- 5 6) 7"
    if (stringExpression.match(bracketsRegExp)) {
        const lastOpenBracketPosition = stringExpression.lastIndexOf("(");
        const lastCloseBracketPosition = stringExpression.indexOf(")", lastOpenBracketPosition);
        const bracketExpression = stringExpression.substring(lastOpenBracketPosition, lastCloseBracketPosition + 1);
        const formattedExpression = stringExpression.replace(bracketExpression, calcSimpleExpression(bracketExpression));
        return calc(formattedExpression, true);
    } else return calcSimpleExpression(stringExpression);
}

// console.log(calc("*(* 5 6) 7"));