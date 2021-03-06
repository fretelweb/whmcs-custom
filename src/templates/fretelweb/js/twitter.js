/**
 * Javascript functions used to fetch the twitter feed.
 *
 * @file WHMCS Six Theme Twitter Javascript Function
 * @copyright Copyright 2015 WHMCS Limited
 */

jQuery(document).ready(function () {
   // Number should be between 1 and 2, since this is a limit of
   // Twitter's "Web Intents" setup.
   WHMCS.http.jqClient.post("index.php?rp=/announcements/twitterfeed", { numtweets: 3 },
      function (data) {
         data = data.replace(/&quot;/g, "\"")
            .replace(/&lt;/g, "<")
            .replace(/&gt;/g, ">")
            .replace(/Síganos @/g, 'Síganos ');

         console.log(data);
         jQuery("#twitterFeedOutput").html(data);
      });
});
