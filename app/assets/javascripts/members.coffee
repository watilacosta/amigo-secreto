$(document).on 'turbolinks:load', ->
  $('.create_member input').bind 'blur', ->
    $('.create_member').submit()

  $('.create_member').on 'submit', (e) ->
    $.ajax e.target.action,
      url: '/members'
      type: 'POST'
      dataType: 'json',
      data: $('.create_member').serialize()
      success: (data, text, jqXHR) ->
        Materialize.toast('Membro inserido na campanha', 4000, 'green')
      error: (jqXHR, textStatus, errorThrown) ->
        Materialize.toast('Erro ao inserir membro!', 4000, 'red')
    return false


  $('.remove_member').on 'click', (e) ->
    $.ajax e.target.action,
      url: "/members"
      type: 'DELETE'
      dataType: 'json',
      data: {}
      success: (data, text, jqXHR) ->
        $(location).attr('href', '/campaigns/:id')
      error: (jqXHR, textStatus, errorThrown) ->
        Materialize.toast('Problema na remoção do Membro', 4000, 'red')
    return false