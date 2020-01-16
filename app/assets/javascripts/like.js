$(function(){
  function buildHTML(like){
    var html =
      `<div class="like-link" id="like-link-<%= post.id %>">
        <% if current_user.likes.find_by(post_id: post.id) %>
          <%= link_to post_like_path(post), method: :delete, remote: true do %>
            <div><i class="fas fa-heart liked"></i><%= post.likes_count %></div>
          <% end %>
        <% else %>
          <%= link_to post_likes_path(post), method: :post, remote: true do %>
            <div><i class="far fa-heart"></i><%= post.likes_count %></div>
          <% end %>
        <% end %>
      </div>`
    return html;
  }
  $('.like-link').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(like){
      var html = buildHTML(like);
      $('.like-link').append(html);
      $('.like-link').prop('disabled', false);
    })
    // .fail(function(){
    //   alert('error');
    // })
  })
});