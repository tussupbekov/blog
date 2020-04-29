<#import '../base_layout.ftlh' as base>
<@base.base_layout>
  <div class="h-full w-full flex justify-center items-center">
    <form class="flex flex-col items-center" method="post">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <div class="text-5xl mt-12 text-theme-violet font-bold font-baloo-bhai-2 mb-4">Login to the site</div>
      <label>
        Username:<br>
        <input class="px-4 py-2 text-lg border border-gray-400 rounded-lg" name="username" type="text" placeholder="Enter your username" required>
      </label>
      <label class="mb-4 mt-2">
        Password:<br>
        <input class="px-4 py-2 text-lg border border-gray-400 rounded-lg" name="password" type="password" placeholder="Enter your password" required>
      </label>
      <button class="px-4 py-2 text-lg border w-32 font-semibold border-theme-green rounded-lg text-theme-green bg-white hover:bg-theme-green hover:text-white duration-200" type="submit">Login</button>
      <a href="/register" class="text-theme-green hover:underline text-lg my-3">Create an account</a>
    </form>
  </div>
</@base.base_layout>