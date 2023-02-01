// `related_page /blog/file site.pages`
// It returns an array of objects of the form:
//  [
//    #{ uri: "path/to/page", page: PageObject }
// ]
let target = params[0];
let pages = params[1];
let size = pages.len();

let blog_pages = [];

let index = -1;
let former_key = "";
let former_item = "";

for (item, i) in pages.keys() {
    if item.index_of("/content/blog/") == 0 {
        let path = item.sub_string(8);
        path = path.sub_string(0, path.index_of(".md"));
        if index >= 0 {
            if i - index > 2 {break};
            if index > 0 && i - index > 1 {break};

            blog_pages.push(#{
                related_uri: path,
                page: pages[item],
            });

        }
        if path == target {
            index = i;
            if i > 0 {
                blog_pages.push(#{
                    related_uri: former_key,
                    page: pages[former_item],
                }); 
            }
        }
        former_key = path;
        former_item = item;
    }

}

blog_pages.reverse();
blog_pages