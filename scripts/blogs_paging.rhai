// This function lists all of the blog posts, subject to the constraints.
// It assumes you have a `content/blog` subdirectory, and every file in there
// is treated like a blog post.
//
// It returns an array of objects of the form:
//  [
//    #{ uri: "path/to/page", page: PageObject }
// ]

// Param 1 should be `site.pages`
let pages = params[0];
let str_cur_page = params[1];

let pindex = str_cur_page.index_of("?p=");
let cur_page = 1;
if (pindex > 0 && str_cur_page.len() > pindex + 3) {
    try {
        cur_page = parse_int(str_cur_page.sub_string(pindex + 3));
    } catch (err) {}
}
// Just for protect
if (cur_page < 1 || cur_page > 5000) {
    cur_page = 1;
}

let page_size = 6;

// Loop through them and return all of the page objects that are in
// the blog path.

let blog_pages = [];
let result = #{};
// Get each blog post, assigning it to {path: object}.
let keys = pages.keys();
keys.reverse();

let total = 0;
for item in keys {
    if item.index_of("/content/blog/") == 0 {
        total += 1;
        if total <= (cur_page -1) * page_size {
            continue;
        }
        // fetch one more than page_size
        if (blog_pages.len() >= page_size) {
            break;
        }
        // Remove /content and .md
        let path = item.sub_string(8);
        path = path.sub_string(0, path.index_of(".md"));
        blog_pages.push(#{
            uri: path,
            page: pages[item],
        });

    }
   
}
if total > page_size {
    let page_total = total / page_size; // TODO not the real total
    if total % page_size > 0 {
        page_total += 1;
    }
    let paginator = #{
        page: page_total,
    };
    if page_total > cur_page {
        paginator.next_page = "" + (cur_page + 1);
    }
    if cur_page > 1 {
        paginator.previous_page = "" + (cur_page - 1);
    }
    result._paginator = paginator;
}

result.blog_pages = blog_pages;
result