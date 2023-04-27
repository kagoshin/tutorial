'use strict';

var userData = null;
var table = null;

/** 画面ロード時の処理. */
jQuery(function($) {

    // DataTablesnの初期化
    createDataTables();

    /** 検索ボタンを押したときの処理. */
    $('#btn-search').click(function(event) {
        // 検索
        search();
    });
});

/** 検索処理. */
function search() {

    // formの値を取得
    var formData = $('#user-search-form').serialize();

    // ajax通信
    $.ajax({
        type: "GET",
        url: '/user/get/list',
        data: formData,
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        timeout: 5000,
    }).done(function(data) {
        // ajax成功時の処理
        console.log(data);

        userData = data;

        createDataTables();

    }).fail(function(jqXHR, textStatus, errorThrown) {
        // ajax失敗時の処理
        alert('検索処理に失敗しました');
    }).always(function() {
        // 常に実行する処理
    });
}

/** DataTables作成 */
function createDataTables() {

    if (table !== null) {
        table.destroy();
    }

    table = $('#user-list-table').DataTable({

        language: {
            url: '/webjars/datatables-plugins/i18n/Japanese.json'
        },

        data: userData,

        columns: [
            { data: 'userId' },
            { data: 'userName' },
            {
                data: 'birthday',
                render: function(data, type, row) {
                    var date = new Date(data);
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var date = date.getDate();
                    return year + '/' + month + '/' + date;
                }
            },
            { data: 'age' },
            {
                data: 'gender',
                render: function(data, type, row) {
                    var gender = '';
                    if (data === 1) {
                        gender = '男性'
                    } else {
                        gender = '女性'
                    }
                    return gender;
                }
            },
            {
                data: 'userId',
                render: function(data, type, row) {
                    var url = '<a href="/user/detail/' + data + '">詳細</a>';
                    return url;
                }
            },
        ]
    });
}