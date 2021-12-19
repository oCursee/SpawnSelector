$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
   
    $("#close").click(function () {
        $.post('http://curse-spawnmanager/exit', JSON.stringify({}));
        return
    })
   
    $("#legion").click(function () {
       $.post('http://curse-spawnmanager/legion', JSON.stringify({}));
       $.post('http://curse-spawnmanager/exit', JSON.stringify({}));  
    })
    $("#pier").click(function () {
        $.post('http://curse-spawnmanager/pier', JSON.stringify({}));
        $.post('http://curse-spawnmanager/exit', JSON.stringify({}));
        
     })
     $("#arena").click(function () {
        $.post('http://curse-spawnmanager/arena', JSON.stringify({}));
        $.post('http://curse-spawnmanager/exit', JSON.stringify({}));
        
     })
     $("#mirror").click(function () {
        $.post('http://curse-spawnmanager/mirror', JSON.stringify({}));
        $.post('http://curse-spawnmanager/exit', JSON.stringify({}));
        
     })
     $("#sandy").click(function () {
        $.post('http://curse-spawnmanager/sandy', JSON.stringify({}));
        $.post('http://curse-spawnmanager/exit', JSON.stringify({}));
        
     })
})
