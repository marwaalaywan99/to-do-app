import http from "http"

http.createServer(
    function(req, res){
        res.write('API is running');
        res.end();
        }
).listen(8080)