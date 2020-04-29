<#import '../base_layout.ftlh' as base>
<@base.base_layout>
  <div class="h-full w-full flex justify-center items-center">
    <form class="flex flex-col items-center" method="post">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <div class="text-5xl mt-8 text-theme-violet font-bold font-baloo-bhai-2 mb-2">Register to the site</div>
      <label>
        Username:<br>
        <input class="px-4 py-2 text-lg border border-gray-400 rounded-lg" name="username" type="text" placeholder="Enter your username" required>
      </label>
      <label class="mt-2">
        Email:<br>
        <input class="px-4 py-2 text-lg border border-gray-400 rounded-lg" name="email" type="email" placeholder="Enter your email" required>
      </label>
      <label class="mt-2">
        Password:<br>
        <input class="px-4 py-2 text-lg border border-gray-400 rounded-lg" name="password" type="password" placeholder="Enter your password" required>
      </label>
      <label class="mt-2 mb-4">
        Retype Password:<br>
        <input class="px-4 py-2 text-lg border border-gray-400 rounded-lg" type="password" placeholder="Retype your password" required>
      </label>
      <button class="px-4 py-2 text-lg border border-theme-green rounded-lg text-theme-green bg-white hover:bg-theme-green hover:text-white duration-200" type="submit">Register</button>
    </form>
  </div>
</@base.base_layout>