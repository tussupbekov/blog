<#import '../base_layout.ftlh' as base>
<@base.base_layout>
  <form class="flex flex-col items-start" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <div class="text-5xl mt-4 text-theme-violet font-bold font-baloo-bhai-2 mb-2">Add Post</div>
    <div class="flex">
      <label for="titleInput" class="w-32 text-lg">Title:</label>
      <input id="titleInput" type="text" name="title" placeholder="Enter title" class="w-64 px-4 py-2 text-lg border border-gray-400 rounded-lg" required>
    </div>
    <div class="flex my-4">
      <div class="w-32 text-lg">Topics:</div>
      <div>
        <label><input type="radio" name="topic" value="HTML" checked> HTML</label><br>
        <label><input type="radio" name="topic" value="CSS"> CSS</label><br>
        <label><input type="radio" name="topic" value="JavaScript"> JavaScript</label><br>
        <label><input type="radio" name="topic" value="React"> React</label><br>
        <label><input type="radio" name="topic" value="Vue"> Vue</label><br>
      </div>
    </div>
    <div class="flex mb-4">
      <label for="textInput" class="w-32 text-lg">Text:</label>
      <div>
        <textarea name="text" id="textInput" placeholder="Enter text" class="h-32 w-64 px-4 py-2 text-lg border border-gray-400 rounded-lg"></textarea>
      </div>
    </div>
    <button type="submit" class="px-4 py-2 text-lg border border-theme-green rounded-lg text-theme-green bg-white hover:bg-theme-green hover:text-white duration-200">Submit</button>
  </form>
</@base.base_layout>