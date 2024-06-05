module.exports = {
    apps: [{
        name: "rails-app",
        script: "bin/rails",
        args: "s -b 0.0.0.0 -p 3001 -e production",
        instances: "max",
        exec_mode: "cluster"
    }]
}
