node 'node1' {

    notify {"************NODE 1**************" : }
    include prefs
    include base
    class {'::tomcat':
        user   =>  'tomcat',
        group  =>  'tomcat',
        service_state => 'running',
    }
    
    tomcat::deploy { 'sysfoo':
         deploy_url => 'https://11-162922251-gh.circle-artifacts.com/0/tmp/sysfoo.war',
         checksum_value => '2c393c035314864987df532f9f937afe'
    }
}

node default {
     notify { "CHECKPOINT_1":
          message => "

            This is the default node.
        
           ",
            
     }
}

node 'node2' {

    notify {"************NODE 2**************" : }
    include prefs
    include base
    class {'::tomcat':
        user   =>  'tomcat',
        group  =>  'root',
        service_state => 'running',
    }
      tomcat::deploy { 'sysfoo':
         deploy_url => 'https://12-162922251-gh.circle-artifacts.com/0/tmp/sysfoo.war',
    }
}
