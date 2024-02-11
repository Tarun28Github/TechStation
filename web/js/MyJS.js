/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function doLike(pid,uid)
{    
    const d={        
        pid: pid,
        uid: uid,
        operation : "like"        
    };
    
    $.ajax({
        
        url : "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            
            console.log(data);
            
            if(data.trim() === 'true'){
                let c = $(".count_like").html();
                c++;
                $('.count_like').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error");
        }
    });
}


