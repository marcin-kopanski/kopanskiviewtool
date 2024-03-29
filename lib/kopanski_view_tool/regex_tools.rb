module KopanskiViewTool
   class RegexTools
      def self.wrap_url_with_href text
         regex = %r{
            \b
               (
                  (?: [a-z][\w-]+:
                     (?: /{1,3} | [a-z0-9%] ) |
                        www\d{0,3}[.] |
                        [a-z0-9.\-]+[.][a-z]{2,4}/
                  )
                  (?:
                     [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
                  )+
                  (?:
                     \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
                     [^\s`!()\[\]{};:'".,<>?«»“”‘’`]
                  )
               )
            }ix
         
         text.gsub(regex) do |url|
            "<a href='#{url}' target='_blank'>#{url}</a>"
         end.html_safe
      end
   end
end