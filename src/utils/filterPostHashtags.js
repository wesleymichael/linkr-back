export default function filterPostHashtags(postDescription) {
  return postDescription
    .match(/#\w+/g)
    ?.filter((value, index, array) => array.indexOf(value) === index)
    .map((v) => v.replace("#", ""));
}
