(function() {
    'use strict';

    window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');

        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);



    $('.getCode').on('click',function () {
        var btn = $(this);
        btn.prop('disabled','disabled');
        $.getJSON(site_url + "json.php?req=get_new_secret_code&key="+keyword,function (response) {

            if(response.status === true) {
                btn.hide();
                btn.parent().append("<span class='badge badge-warning'>Your code : "+response.msg+"</span>");
            }else {
                $('form').html("<div class='alert alert-danger'>"+response.msg+"</div>").show();
            }
        });
    });


    $("#return_form").on('submit',function (e) {
        var btn = $("#return_form").find('button');
        btn.prop('disabled','disabled');
        e.preventDefault();
        $.post(site_url + "json.php",$(this).serialize(),function (response) {
            if(response.status === true) {
                window.location.replace(response.msg);
            }else {
                $(".alert").html(response.msg).show();
                btn.prop('disabled',false);
            }
        },'json');
    });


    $("#login").on('submit',function (e) {
        e.preventDefault();
        $.post(site_url + "json.php",$(this).serialize(),function (response) {
            if(response.status === true) {
                window.location.replace(response.msg);
            }else {
                $(".alert").show();
            }
        },'json');
    });

    $('[data-toggle="tooltip"]').tooltip({html: true});

})();