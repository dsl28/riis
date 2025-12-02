window.addEventListener('DOMContentLoaded',init,false);
            


  
function init() {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "immigrantstoggle": {
            var ref = document.getElementsByClassName("immigrants");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        case "conditionstoggle": {
            var ref = document.getElementsByClassName("conditions");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        case "deathtoggle": {
            var ref = document.getElementsByClassName("death");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        case "vicetoggle": {
            var ref = document.getElementsByClassName("vice");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        case "diseasetoggle": {
            var ref = document.getElementsByClassName("disease");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        
        case "crimetoggle": {
            var ref = document.getElementsByClassName("crime");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        
        case "worktoggle": {
            var ref = document.getElementsByClassName("work");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        
        case "policingtoggle": {
            var ref = document.getElementsByClassName("policing");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        
         case "tabletoggle": {
            var ref = document.getElementsByClassName("table");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        
         case "childrentoggle": {
            var ref = document.getElementsByClassName("children");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
        
         case "charitytoggle": {
            var ref = document.getElementsByClassName("charity");
            for (var i = 0; i < ref.length; i++) {
                ref[i].classList.toggle("on")
            }
        };
        break;
    }
     
  }  