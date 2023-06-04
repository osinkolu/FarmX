import Share from "@components/Share";
import dateFormat from "@lib/utils/dateFormat";
import { markdownify } from "@lib/utils/textConverter";
import shortcodes from "@shortcodes/all";
import { MDXRemote } from "next-mdx-remote";
import Image from "next/image";

const PostSingle = ({ post, slug }) => {
  const { frontmatter, content, mdxContent } = post;
  let { description, title, date, image } = frontmatter;
  description = description ? description : content.slice(0, 120);

  return (
    <>
      <section className="section">
        <div className="container">
          <article className="text-center">
            {markdownify(title, "h1", "h2")}
            <ul className="mt-4 mb-8 flex flex-wrap items-center justify-center space-x-3 text-text">
              <li>{dateFormat(date)}</li>
            </ul>
            {image && (
              <Image
                src={image}
                height="500"
                width="1000"
                alt={title}
                className="rounded-lg"
              />
            )}
            <div className="content mb-16 text-left">
              <MDXRemote {...mdxContent} components={shortcodes} />
            </div>
            <div className="flex flex-wrap items-center justify-between">
             
              <Share
                className="social-share mb-4"
                title={title}
                description={description}
                slug={slug}
              />
            </div>
          </article>
        </div>
      </section>
    </>
  );
};

export default PostSingle;
