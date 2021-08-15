#!/usr/bin/env ruby

require "net/http"

DEBUG = 1
REPOS = [
  "kubernetes/kubernetes/master",
  "kubernetes/k8s.io/main",
  "kubernetes/kops/master",
  "kubernetes/website/main",
  "kubernetes/ingress-nginx/main",
  "kubernetes/minikube/master",
  "kubernetes/cloud-provider-alibaba-cloud/master",
  "kubernetes/node-problem-detector/master",
  "kubernetes/autoscaler/master",
  "kubernetes/community/master",
  "docker/compose/master",
  "docker/roadmap/master",
  "docker/awesome-compose/master",
  "docker/build-push-action/master",
  "docker/compose-cli/main",
  "docker/node-sdk/main",
  "redis/redis/unstable",
  "redis/jedis/master",
  "redis/redis-doc/master",
  "redis/redis-io/master",
  "redis/hiredis/master",
  "redis/redis-debian/master",
  "redis/redis-snap/master",
  "nodejs/nodejs.org/master",
  "nodejs/node/master",
  "nodejs/diagnostics/main",
  "nodejs/undici/main",
  "nodejs/nodejs.dev/main",
  "nodejs/node-addon-api/main",
  "nodejs/nodejs-ko/main",
  "nodejs/node-v8/main",
  "nodejs/snap/master",
  "nodejs/i18n/master",
  "python/python-docs-zh-cn/master",
  "python/typeshed/master",
  "python/cpython/main",
  "python/importlib_metadata/main",
  "python/mypy/master",
  "python/planet/master",
  "python/peps/master",
  "heroku/flow-demo/master",
  "heroku/log-shuttle/master",
  "heroku/php-getting-started/main",
  "heroku/cli/master/",
  "heroku/heroku-buildpack-nodejs/master",
  "heroku/heroku-cli-status/master",
  "heroku/cli-flags/master",
  "heroku/webapp-runner/main",
  "heroku/pack-images/master",
  "heroku/heroku-buildpack-python/main"
]

def genelate_url
  urls = []
  REPOS.each do |repo|
    urls << "https://raw.githubusercontent.com/#{repo}/README.md"
  end
  urls
end

def url_gsub(url)
  url.gsub(/\)/, "").gsub(/\.$/, "").gsub(/\,$/, "").gsub(/\'$/, "")
end

def exec_requests(urls)
  urls.each_with_index { |url, i|
    p "=== #{REPOS[i].split("/")[0..1].join("/")} ===="
    uri = URI.parse(url)
    resp = Net::HTTP.get_response(uri)
    if resp.code == "200"
      URI.extract(resp.body).each do |u|
        begin
          uri = URI.parse(url_gsub(u))
          resp = Net::HTTP.get_response(uri)
          if resp.code == "404"
            print "\e[31m\e[5m#{u}\t#{resp.code}\e[0m\n"
          end
        rescue
          next
        end
      end
    else
      p "not #{resp.code}"
    end
  }
end


def main
  exec_requests(genelate_url)
end

main
