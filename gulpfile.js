const { watch, series } = require(`gulp`);

let command = `build-deck.sh`;

function build () {
    let exec = require(`child_process`).exec;

    return exec(command, function (error, stdout, stderr) {
        if (null !== error) {
            process.stdout.write(
                `An error was generated while invoking ${command}. S👀 error below ⬇\n\t${stderr}`);
        }

        if (`` !== stderr) {
            process.stdout.write(
                `The “stderr” stream threw an error while running “${command}”. S👀 error below ⬇\n\t${stderr}`);
        }
    });
}

let serve = () => {
    watch([`./markdown-slides/*`, `./build-deck.sh`], series(build));
};

exports.default = series(build, serve);
